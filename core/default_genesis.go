// Copyright 2014 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package core

import (
    "compress/gzip"
    "encoding/base64"
    "io"
    "strings"
)

func NewDefaultGenesisReader() (io.Reader, error) {
    return gzip.NewReader(base64.NewDecoder(base64.StdEncoding, strings.NewReader(defaultGenesisBlock)))
}

// defaultGenesisBlock is a gzip compressed dump of the official default Dubaicoin
// genesis block.

const ( defaultGenesisBlock = "H4sIAAAAAAAA/61RwQ6CMAw9w1eQnT1sbMDwjIkHf6KrRZfAMDITDOHfRZCYaEyM8d36Xt9r0/ZhNIK5xiGxdcR4x5+QMRcZW80t3tbUeqhPc1uiC54XYrPIJziT81toj28xP2HJpc6foQAPj9iFP0C7s7X1My1Uni/K3palxUvlr7OmXhJr2x3/viY21hlo32/4lRuqqsHR2k/lRPFOozaEMRiZUI4alcREpcLoTChKRUoyMwqI330RM1DB44ep/DBtCINgmjCEww2s3pW/+QEAAA=="

defaultTestnetGenesisBlock = defaultGenesisBlock

)