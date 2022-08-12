import json
import logging
import traceback


class JsonFormatter(logging.Formatter):
    def format(self, record):
        if self.usesTime():
            record.asctime = self.formatTime(record, self.datefmt)

        json_log = {
            'aws_request_id': getattr(record, 'aws_request_id', '00000000-0000-0000-0000-000000000000'),
            'log_level': str(getattr(record, 'levelname', '')),
            'timestamp': '%(asctime)s.%(msecs)dZ' % dict(asctime=record.asctime, msecs=record.msecs),
            'aws_request_id': getattr(record, 'aws_request_id', '00000000-0000-0000-0000-000000000000'),
            'message': record.getMessage(),
            'status_code': str(getattr(record, 'status_code', '')),
            'execution_time': str(getattr(record, 'execution_time', '')),
            'stack_trace': {},
        }

        request = getattr(record, 'request', None)

        if request:
            json_log = {
                'aws_cf_id': request.META.get('HTTP_X_AMZ_CF_ID', ''),
                'aws_trace_id': request.META.get('HTTP_X_AMZN_TRACE_ID', ''),
                'x_real_ip': request.META.get('HTTP_X_REAL_IP', ''),
                'x_forwarded_for': request.META.get('HTTP_X_FORWARDED_FOR', ''),
                'request_method': request.method,
                'request_path': request.get_full_path(),
                'request_body': request.request_body,
                'user_agent': request.META.get('HTTP_USER_AGENT', ''),
                'user': str(getattr(request, 'user', '')),
                'stack_trace': {},
            }

        if record.exc_info:
            json_log['stack_trace'] = traceback.format_exc().splitlines()

        return json.dumps(json_log, ensure_ascii=False)
