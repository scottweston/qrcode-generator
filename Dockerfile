FROM alpine
MAINTAINER Scott Weston <scott@srw.id.au>

RUN set -x \
  && apk add -U perl perl-dev build-base libqrencode-dev \
  && (echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan \
  && cpan Term::ANSIColor Text::QRCode \
  && apk del perl-dev build-base

ADD qrcode /root/qrcode

ENTRYPOINT ["/root/qrcode"]
