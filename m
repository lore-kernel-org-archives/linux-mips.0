Subject: Re: uclibc mips ld.so and undefined symbols with nonzero symbol
 table entry st_value
References: <045b01c43155$1e06cd80$8d01010a@prefect>
From: Richard Sandiford <rsandifo@redhat.com>
Date: Sun, 09 May 2004 14:14:33 +0100
In-Reply-To: <045b01c43155$1e06cd80$8d01010a@prefect> (Bradley D. LaRonde's
 message of "Mon, 3 May 2004 17:25:11 -0400")
Message-ID: <874qqpg2ti.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <rsandifo@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040509131433.XB3iiJ7xithi39XS5NM6Fhehsm-WtFbPDYCfR4HtRfA@z>

"Bradley D. LaRonde" <brad@laronde.org> writes:
> I guess that the point of these procedure stubs is to keep
> pointer-to-function values consistent between executables and share
> libraries.  Is that what binutils is trying to accomplish here?

No, it's to enable lazy binding.  The idea is that when the dynamic
loader loads libpthread.so, it doesn't need to resolve malloc()
immediately, it can just leave the GOT entry pointing to the stub.
Then, when the stub is called, it will ask the dynamic linker to
find the true address of malloc() and update the GOT accordingly.
This is supposed to reduce start-up time.

An object should never use stubs if takes the address of the function.
It should only use a stub for some symbol foo if every use of foo is
for a direct call.

If the dynamic loader is choosing libpthread's stub over the real
definition in libc.so, that sounds on the face of it like a dynamic
loader bug.

> But should stubs really be getting involved here?  As Thiemo Seufer pointed
> out to me, readelf shows me that every undefined symbol in every shared
> library in /lib on my x86 debian box has the st_value member for the symbol
> table entry set to zero.

The x86 and MIPS ABIs are very different though.

Richard
