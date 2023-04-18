FROM golang:1.20.2-alpine3.17 AS builder
RUN go install tailscale.com/cmd/derper@main

FROM scratch
COPY --from=builder /go/bin/derper /go/bin/derper
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/go/bin/derper"]
