Subject: Re: uclibc mips ld.so and undefined symbols with nonzero symbol
 table entry st_value
References: <045b01c43155$1e06cd80$8d01010a@prefect>
	<874qqpg2ti.fsf@redhat.com> <012701c43607$83aa65f0$8d01010a@prefect>
	<87pt9cwwzu.fsf@redhat.com> <00e201c436b9$5fa0f450$8d01010a@prefect>
From: Richard Sandiford <rsandifo@redhat.com>
Date: Mon, 10 May 2004 19:21:04 +0100
In-Reply-To: <00e201c436b9$5fa0f450$8d01010a@prefect> (Bradley D. LaRonde's
 message of "Mon, 10 May 2004 14:05:27 -0400")
Message-ID: <878yg0m9db.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <rsandifo@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040510182104.txii3rkOFrRzbYYXi-k9TiAqU-TIHuC9IWxKL9xXNec@z>

"Bradley D. LaRonde" <brad@laronde.org> writes:
> Even though it is pointing libdl to the libpthread stub for malloc, should
> it crash?

Yeah.  When you call a stub, $gp must already be set to the owning
object's _gp.  That's how the dynamic loader knows which GOT to change.

In your case, libdl will be calling libpthread's stub with $gp set to
libdl's _gp.  The dynamic loader will therefore end up trying to change
libdl's GOT, not libpthread's.

Richard
