xquery version "1.0-ml";
module namespace renderToHtml = "http://marklogic.com/rest-api/transform/render-to-html";

declare function renderToHtml:transform(
        $context as map:map,
        $params as map:map,
        $content as document-node()
) as document-node()
{

    if (fn:empty($content/*))
    then
        $content
    else
        let $_ := xdmp:log(concat("testing....", map:get($context,"uri")))
        let $uri := map:get($context, 'uri')
        let $xsl_file := concat('/', fn:tokenize($uri,'/')[2],'-html-output.xsl')
        let $_ := xdmp:log(concat("xsl file: ", $xsl_file))
        let $data := $content/node()
        let $_ := xdmp:log('>>>>>>>>>> data is: ')
        let $_ := xdmp:log($data)

        let $t :=  xdmp:xslt-invoke($xsl_file, document { $data })
        let $_ := xdmp:log(concat('>>>>>>>>>>>>>>>>>>>>>>>>> output is ', $t))
        let $json := json:object()
        let $_ := map:put($json,'xml', xdmp:quote($t))
        return xdmp:to-json($json)

};
