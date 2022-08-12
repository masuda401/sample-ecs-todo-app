import copy
import json
import logging
import re
import time

from django.utils.deprecation import MiddlewareMixin

request_logger = logging.getLogger('backend')


class RequestLogMiddleware(MiddlewareMixin):
    """Request Logging Middleware."""

    def __init__(self, *args, **kwargs):
        """Constructor method."""
        super().__init__(*args, **kwargs)

    def is_json_format(self, request_body):
        try:
            json.loads(request_body)
        except json.JSONDecodeError:
            return False

        return True

    def process_request(self, request):
        """Set Request Start Time to measure time taken to service request."""
        request.start_time = time.time()
        request.request_body = ''
        if request.method in ['PUT', 'POST', 'PATCH']:
            try:
                request_body = request.body.decode('utf-8')

                if request_body and self.is_json_format(request_body):
                    request.request_body = json.loads(request_body)
                else:
                    request.request_body = request_body
            except UnicodeDecodeError:
                # request.request_body = str(base64.b64encode(request.body))
                request_body = copy.deepcopy(request.body)
                first_file_name = ''
                file_names = re.findall('filename=\".*\"\\\\r\\\\nContent-Type', str(request_body))
                if len(file_names) > 0:
                    first_file_name = file_names[0]
                    first_file_name = first_file_name.replace('\\r\\nContent-Type', '')
                    first_file_name = first_file_name.replace('\\\\', '\\')
                request.request_body = first_file_name

    def process_response(self, request, response):
        status_code = getattr(response, 'status_code', '')
        log_info = {
            'request': request,
            'status_code': status_code,
            'execution_time': time.time() - request.start_time,
        }
        if status_code == 200:
            request_logger.info(msg='OK', extra=log_info)
        return response
