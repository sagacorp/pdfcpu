FROM --platform=$BUILDPLATFORM golang:1.17-alpine as pdfcpu_builder

ENV PDFCPU_VERSION  v0.3.12
RUN go install github.com/pdfcpu/pdfcpu/cmd/...@${PDFCPU_VERSION} \
    && cd pkg/mod/github.com/pdfcpu/pdfcpu@${PDFCPU_VERSION}/cmd/pdfcpu \
    && CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH} go build -a -o /out/pdfcpu .
