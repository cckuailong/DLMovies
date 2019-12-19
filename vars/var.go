package vars

type SearchRes struct{
	Code int
	Info []Info
}

type Info struct{
	Title string `json:"title"`
	Actors string `json:"actors"`
	Region string `json:"region"`
	Desc string `json:"desc"`
	Urls string `json:"urls"`
}

type FinalInfo struct{
	Title string `json:"title"`
	Urls []map[string]interface{} `json:"urls"`
	Len int
}
