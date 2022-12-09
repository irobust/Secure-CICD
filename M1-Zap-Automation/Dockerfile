FROM owasp/zap2docker-stable
USER zap

COPY start.sh /zap
EXPOSE 8090

USER root
RUN chmod +x /zap/start.sh
CMD ["/zap/start.sh"]