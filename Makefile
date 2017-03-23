# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gdbix gdbix-cross evm all test clean
.PHONY: gdbix-linux gdbix-linux-386 gdbix-linux-amd64 gdbix-linux-mips64 gdbix-linux-mips64le
.PHONY: gdbix-linux-arm gdbix-linux-arm-5 gdbix-linux-arm-6 gdbix-linux-arm-7 gdbix-linux-arm64
.PHONY: gdbix-darwin gdbix-darwin-386 gdbix-darwin-amd64
.PHONY: gdbix-windows gdbix-windows-386 gdbix-windows-amd64
.PHONY: gdbix-android gdbix-ios

GOBIN = build/bin
GO ?= latest

gdbix:
	build/env.sh go run build/ci.go install ./cmd/gdbix
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gdbix\" to launch gdbix."

evm:
	build/env.sh go run build/ci.go install ./cmd/evm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/evm to start the evm."

all:
	build/env.sh go run build/ci.go install

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ Godeps/_workspace/pkg $(GOBIN)/*

# Cross Compilation Targets (xgo)

gdbix-cross: gdbix-linux gdbix-darwin gdbix-windows gdbix-android gdbix-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-*

gdbix-linux: gdbix-linux-386 gdbix-linux-amd64 gdbix-linux-arm gdbix-linux-mips64 gdbix-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-*

gdbix-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/386 -v ./cmd/gdbix
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep 386

gdbix-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/amd64 -v ./cmd/gdbix
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep amd64

gdbix-linux-arm: gdbix-linux-arm-5 gdbix-linux-arm-6 gdbix-linux-arm-7 gdbix-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep arm

gdbix-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/arm-5 -v ./cmd/gdbix
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep arm-5

gdbix-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/arm-6 -v ./cmd/gdbix
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep arm-6

gdbix-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/arm-7 -v ./cmd/gdbix
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep arm-7

gdbix-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/arm64 -v ./cmd/gdbix
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep arm64

gdbix-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/mips64 -v ./cmd/gdbix
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep mips64

gdbix-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=linux/mips64le -v ./cmd/gdbix
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-linux-* | grep mips64le

gdbix-darwin: gdbix-darwin-386 gdbix-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-darwin-*

gdbix-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=darwin/386 -v ./cmd/gdbix
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-darwin-* | grep 386

gdbix-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=darwin/amd64 -v ./cmd/gdbix
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-darwin-* | grep amd64

gdbix-windows: gdbix-windows-386 gdbix-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-windows-*

gdbix-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=windows/386 -v ./cmd/gdbix
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-windows-* | grep 386

gdbix-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=windows/amd64 -v ./cmd/gdbix
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-windows-* | grep amd64

gdbix-android:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=android-21/aar -v ./cmd/gdbix
	@echo "Android cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-android-*

gdbix-ios:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --dest=$(GOBIN) --targets=ios-7.0/framework -v ./cmd/gdbix
	@echo "iOS framework cross compilation done:"
	@ls -ld $(GOBIN)/gdbix-ios-*
