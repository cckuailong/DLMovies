package models

type Monitor struct {
	Nexthop		string
	Asn 		string
	Peer 		string
	Peerasn		string
	Type 		int
	Prefixes 	int
	D_prefixes	int
	Msg_md5		string
	First		int
	Last		int
}
