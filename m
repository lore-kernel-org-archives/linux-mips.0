Subject: Re: uclibc mips ld.so and undefined symbols with nonzero symbol
 table entry st_value
References: <045b01c43155$1e06cd80$8d01010a@prefect>
	<874qqpg2ti.fsf@redhat.com> <012701c43607$83aa65f0$8d01010a@prefect>
	<87pt9cwwzu.fsf@redhat.com> <00e201c436b9$5fa0f450$8d01010a@prefect>
	<878yg0m9db.fsf@redhat.com> <01a901c436ce$7029d890$8d01010a@prefect>
From: Richard Sandiford <rsandifo@redhat.com>
Date: Mon, 10 May 2004 21:41:53 +0100
In-Reply-To: <01a901c436ce$7029d890$8d01010a@prefect> (Bradley D. LaRonde's
 message of "Mon, 10 May 2004 16:36:14 -0400")
Message-ID: <87oeowkoa6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <rsandifo@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040510204153.c4BUGqRWamJ86vtOelc0H76tORF08gKHrTkUI7X3TTA@z>

"Bradley D. LaRonde" <brad@laronde.org> writes:
> I read this in the spec:
>
>     All externally visible symbols, both defined and undefined,
>     must be hashed into the hash table.
>
> Should libpthread's malloc stub be added to the hash table?

Yes.

> I guess not, but I think that might be happening (haven't verified),
> and libdl finding it in there and thinking it is the real deal, not
> realizing it is just a stub.

If you have an undefined function symbol with st_value != 0, then
that st_value must be for a stub.  That's how the loader can (and is
supposed to) tell the difference.

It's probably a good idea to look at how glibc handles this.

Richard
