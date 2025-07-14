FROM debian:stable


RUN useradd --uid 111 --gid mail --home-dir /dev/null --shell /sbin/nologin cyrus

RUN apt update && apt install -y cyrus-imapd cyrus-admin sasl2-bin

RUN chown cyrus:mail /var/spool/mail/ && chmod 03775 /var/spool/mail/

ENV CYRUS_VERBOSE=5
ENTRYPOINT ["/usr/lib/cyrus/bin/master"]

EXPOSE 110 143 993 995 4190
