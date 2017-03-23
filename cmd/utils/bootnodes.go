// Copyright 2015 The go-ethereum Authors
// This file is part of go-ethereum.
//
// go-ethereum is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// go-ethereum is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with go-ethereum. If not, see <http://www.gnu.org/licenses/>.

package utils

import "github.com/dbix-project/go-dubaicoin/p2p/discover"

// FrontierBootNodes are the enode URLs of the P2P bootstrap nodes running on
// the Frontier network.
var FrontierBootNodes = []*discover.Node{
	// DBIX/DEV Go Bootnodes
	discover.MustParseNode("enode://81a46c252cae5e60cf01cc645c7bf53d4acfed404e52760588374dc6131a776eab3c7600f457e807de36126d984401a71f80af68f73d2f573da656b89923128e@73.237.167.175:56925"), //node1
	discover.MustParseNode("enode://3326106cfb5426a032708fa782270ef02b636a03a3f5967ea17f68d3c9c3b2a91f2d0666b6f47286364079db699c90ca77092faf356aa87329bb16a5ad5da19d@104.207.152.207:56925"), //node2
	discover.MustParseNode("enode://5318fad854fe915b1f1757dee8e6128cadff9056ed07d449d6409ebdd3a6384e4e2b411d2b8b198beccdfbe98597d3f2519590cd7a8cd02b292d846e51e8c8e9@80.241.222.77:56925"), //dbix b server
	discover.MustParseNode("enode://e1c7b274f8884eb0cb847e86c704a88bff305b67276ec7306352ef01006a1eb4515862b2b862d276ef8817c0f3db57d98466df919b176de65348ab08e45d9b60@45.32.65.104:56925"), //dbix_node1
	discover.MustParseNode("enode://21c5d6a488b44c18c8e0b8c8b5735c1871c9488c48b0a8ebf4d159854e2cc5887e6b445978605027acb1112a34257820cdd11b11d12b7b24f71081963ccbb600@45.32.220.235:56925"), //dbix_node2
	discover.MustParseNode("enode://1dc186aa94c409c9111daf76cc9c69f722a1c4692ff9b65b6451279eb8776388f53d7942b2d2aa74cf84bf4ff4968676337ea284771a171ddb0593d3e1f519e0@45.76.35.129:56925"), //dbix_node3
	discover.MustParseNode("enode://a9b35231b9ffb1f4d116504dd6bc19a4db2d73ff9de71da1eeae4e934df041e879295bc3400bac8cab973ccf3f77dd225ae9088e7f56a852dd6b4a859d202f1a@45.76.138.199:56925"), //dbix_node4
	discover.MustParseNode("enode://a3226190a19db4b9386ca9f789787b447ec3ef572385399487bab080d90d44e63cdd08a0deb33030fb0273a2d3c9ff95cb869114e965c08d54e6ed78a95f89cb@45.32.158.190:56925"), //dbix_node5
}

// TestNetBootNodes are the enode URLs of the P2P bootstrap nodes running on the
// Morden test network.
var TestNetBootNodes = []*discover.Node{
	// ETH/DEV Go Bootnodes
	/*discover.MustParseNode("enode://n4533109cc9bd7604e4ff6c095f7a1d807e15b38e9bfeb05d3b7c423ba86af0a9e89abbf40bd9dde4250fef114cd09270fa4e224cbeef8b7bf05a51e8260d7uv@198.158.98.185.231:54920"),*/

	// ETH/DEV Cpp Bootnodes
}
