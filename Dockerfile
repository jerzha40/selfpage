# Academic Pages/Jekyll development environment. No Ruby is installed on Windows.
FROM ruby:3.2

ARG ACADEMIC_PAGES_REF=c089e79c7bce7ff453de525bc0bb80c261400cf6

RUN apt-get update \
    && apt-get install -y --no-install-recommends git rsync nodejs build-essential \
    && rm -rf /var/lib/apt/lists/*

# Pin the upstream theme so a future upstream edit cannot silently change the site.
RUN mkdir -p /opt/academic-pages \
    && cd /opt/academic-pages \
    && git init -q \
    && git remote add origin https://github.com/academicpages/academicpages.github.io.git \
    && git fetch --depth 1 origin "${ACADEMIC_PAGES_REF}" \
    && git checkout -q --detach FETCH_HEAD \
    && test "$(git rev-parse HEAD)" = "${ACADEMIC_PAGES_REF}"

WORKDIR /opt/academic-pages
RUN gem install bundler -v 2.3.26 --no-document && bundle _2.3.26_ install --jobs 4 --retry 3

COPY scripts/prepare-site.sh /usr/local/bin/prepare-selfres-site
RUN chmod +x /usr/local/bin/prepare-selfres-site \
    && useradd --create-home --uid 10001 selfres \
    && mkdir -p /worksite \
    && chown -R selfres:selfres /worksite

USER selfres
WORKDIR /worksite
EXPOSE 4000
ENTRYPOINT ["/usr/local/bin/prepare-selfres-site"]
CMD ["serve"]
