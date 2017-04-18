xquery version "1.0-ml";

module namespace personil = "http://marklogic.com/example/personil";

declare function personil:decorator($uri as xs:string) as node()*
{
    let $doc := doc($uri)

    return (

        attribute nama { $doc/personil_kemhan/nama },
		attribute gelar { $doc/personil_kemhan/gelar },
		attribute tempat_lahir { $doc/personil_kemhan/tempat_lahir },
		attribute tgl_lahir { $doc/personil_kemhan/tgl_lahir },
		attribute nopeg { $doc/personil_kemhan/nopeg },
		attribute nip { $doc/personil_kemhan/nip },
		attribute pangkat_corps { $doc/personil_kemhan/pangkat_corps },
		attribute angkatan_korps { $doc/personil_kemhan/angkatan_korps },
		attribute kode_jabatan { $doc/personil_kemhan/kode_jabatan },
		attribute eselon_jabatan { $doc/personil_kemhan/eselon_jabatan }
    )

};