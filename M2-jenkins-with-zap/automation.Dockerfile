FROM owasp/zap2docker-stable
USER zap

COPY start-automation.sh /zap
COPY automation-demo.yml /zap

USER root
RUN chmod +x /zap/start-automation.sh
CMD ["/zap/start-automation.sh"]