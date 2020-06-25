FROM node:14

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]

COPY . .

WORKDIR cli

RUN npm install jsdom node-localstorage

CMD ["node", "--expose-gc" ,"master.js"]