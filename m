Message-ID: <009d01c12a48$279347a0$d11110ac@snow.isltd.insignia.com>
From: "Andrew Thornton" <andrew.thornton@insignia.com>
Subject: Re: ? Thread Problem on MIPS Malta Board
Date: Tue, 21 Aug 2001 14:49:52 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_009A_01C12A50.89255500"
Sender: owner-linux-mips@oss.sgi.com
To: mukesh mishra <mukesh167@yahoo.com>, linux-mips@oss.sgi.com
Message-ID: <20010821134952.2il7gE-mnCA3Bp7F4E7PTxvrUy8ThrKCd0AqwgSzEMk@z>

This is a multi-part message in MIME format.

------=_NextPart_000_009A_01C12A50.89255500
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Mukesh,

>I am useing 4 threads in my application .It is works
>in general Linux enviornment(pc).I am using thread say
>"pthread_create".
> At the MIPS Malta (red hat Linux)enviornment
>it is compiling linking but at the time of executing
>(exe file)it is giving error.It is returning value 11

I did the same thing and found the problem to be that the return value from
the clone syscall is mishandled by glibc. My fix was to use the attached
clone.s. I'm sure there is a better fix, probably involving upgrading the
version of glibc, but this got me working.

Andrew Thornton


------=_NextPart_000_009A_01C12A50.89255500
Content-Type: application/octet-stream;
	name="clone.s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="clone.s"

CS50ZXh0CgovKgogKiBpbnQgX19jbG9uZShpbnQgKCpmbikgKHZvaWQgKmFyZyksIHZvaWQgKmNo
aWxkX3N0YWNrLCBpbnQgZmxhZ3MsCiAqIHZvaWQgKmFyZyk7CiAqLwoKCS5nbG9ibAlfX2Nsb25l
CgkuZW50CV9fY2xvbmUKCQpfX2Nsb25lOgoJLnNldAlub3Jlb3JkZXIKCS5jcGxvYWQgJDI1Cglh
ZGRpdSAgICRzcCwkc3AsLTE2CgkuY3ByZXN0b3JlIDgKCS5zZXQJcmVvcmRlcgoKCS8qIEFsaWdu
IHRoZSBzdGFjayB0byA4IGJ5dGVzICovCglsaQkJJDgsIDcKCW5vcgkJJDgsICQwLCAkOAoJYW5k
CQkkNSwgJDUsICQ4CgoJLyogU2V0dXAgdGhlIG5ldyB0aHJlYWQncyBzdGFjayAqLwoJYWRkaXUg
ICAkNSwkNSwtMTYKCXN3ICAgICAgJDQsMCgkNSkKCXN3ICAgICAgJDcsNCgkNSkKCXN3CQkkZ3As
OCgkNSkKCgkvKiBDYWxsIHRoZSBjbG9uZSBzeXNjYWxsICovCgltb3ZlICAgICQ0LCQ2CglsaSAg
ICAgICQyLDQxMjAKCXN5c2NhbGwKCWJuZXogICAgJDcsZXJyb3IKCWJndHogICAgJDIsZG9uZQoJ
Ym5leiAgICAkMixlcnJvcgoKCS8qIFRoZSBuZXcgdGhyZWFkIHN0YXJ0cyBoZXJlICovCglsdyAg
ICAgICQyNSwwKCRzcCkKCWx3ICAgICAgJDQsNCgkc3ApCglqYWwgICAgICQyNQoJbW92ZSAgICAk
NCwkMgoJamFsCQlfZXhpdAoKZXJyb3I6CglsaQkJJDIsLTEKCmRvbmU6CglhZGRpdSAgICRzcCwk
c3AsMTYKCWpyICAgICAgJDMxCgoJLmVuZAlfX2Nsb25lCgo=

------=_NextPart_000_009A_01C12A50.89255500--
