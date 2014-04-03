Received: from [217.156.133.130] ([217.156.133.130]:15962 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-FAIL-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6820484AbaDCLZA2t-gD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Apr 2014 13:25:00 +0200
Message-ID: <533D4505.4050406@imgtec.com>
Date: Thu, 3 Apr 2014 12:24:53 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: MT: proc: Add support for printing VPE and TC ids
References: <1381846382-26437-1-git-send-email-markos.chandras@imgtec.com> <20131016151007.GP1615@linux-mips.org> <533BE58C.3010201@imgtec.com> <20140403112019.GA4365@linux-mips.org>
In-Reply-To: <20140403112019.GA4365@linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="hMdCw455TwxN3QvUdd00d3qaw70uUaPbf"
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20140403112453.3KW4LNUkjdduRrLhQ_R1ZdC_A1EKsTAtodugTR5S5Us@z>

--hMdCw455TwxN3QvUdd00d3qaw70uUaPbf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/04/14 12:20, Ralf Baechle wrote:
> On Wed, Apr 02, 2014 at 11:25:16AM +0100, James Hogan wrote:
>=20
>> Both of these patches seem to be applied, Markos' in v3.14-rc1, and yo=
ur
>> one in mips-for-linux-next:
>>
>> $ cat /proc/cpuinfo
>> ...
>> processor               : 3
>> ...
>> core                    : 1
>> VPE                     : 1
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>> VPE                     : 1
>>
>> Maybe a revert of Markos' patch could be squashed in to your patch?
>=20
> I've reverted this in my tree now.

Thanks Ralf

Cheers
James


--hMdCw455TwxN3QvUdd00d3qaw70uUaPbf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAEBAgAGBQJTPUUFAAoJEGwLaZPeOHZ62UgP/1X4ESavYtLl1mgzs8jCyZhW
0fbE/f79RKVRa+X61yskmUhdQkoH2H27zFgE63DtWKr3eXVTHnt/vXgwjRTk9Tha
MJloH7ZQb0UY66yHOIGc+5Uw5ID5Hv2Tlok10VbdVXI5F+MOq+puw1vOxbscTMUT
idumuDFdM0vqujEPac0tk175xKj0yExaxi3TlpLMs4YPrGFDj0kfhjS2JJy/SxHR
9RXhpUIi0GVUiu4LAD4otqM4sVHsZCNQiFZ/jkGPukdEB9P+zlWnhTD+I6B1/5qu
vdLbSiwgiV5uwxyNTAZBOehp9Xb12LNB/PCXqN7K09+Dn/9jwI24KRo+u9uhOSQK
zTCS+LjP8n4btmduUfUPqAABiJwzRUw9IqtJ/dXOTMyn5YHpt7dVWwPrEJlXPc11
XBDYtiu5AEmFb2ydGEte/Evn8kP60JgU1FwWAWbtz5AhI9VDSNeu991tn8qGZDXW
z0jY4VGcxALZeqs2fRCLtmN/d/jTkSFEq7GtcCP8WCeHjw89ZJ3TwEnV45hSpx1I
JHTsQd9kjJ8RmFlxtkk28FVk7tJHhHAfJWZ7UIARqoVJnowtlyYoGDELkG1T3BAq
HROA9L22apsEUeJXcz/CA64uz56kWZQFoy1BmPB5NImxUggbULKfM9rpK2D3aQOF
Rm6Rg+UI6Bn8RYJpMtyO
=kr55
-----END PGP SIGNATURE-----

--hMdCw455TwxN3QvUdd00d3qaw70uUaPbf--
