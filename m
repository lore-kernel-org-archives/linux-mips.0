Subject: Re: uclibc mips ld.so and undefined symbols with nonzero symbol
 table entry st_value
References: <045b01c43155$1e06cd80$8d01010a@prefect>
	<874qqpg2ti.fsf@redhat.com> <012701c43607$83aa65f0$8d01010a@prefect>
	<87pt9cwwzu.fsf@redhat.com> <00e201c436b9$5fa0f450$8d01010a@prefect>
	<878yg0m9db.fsf@redhat.com> <01a901c436ce$7029d890$8d01010a@prefect>
	<87oeowkoa6.fsf@redhat.com>
From: Richard Sandiford <rsandifo@redhat.com>
Date: Mon, 10 May 2004 21:44:08 +0100
In-Reply-To: <87oeowkoa6.fsf@redhat.com> (Richard Sandiford's message of
 "Mon, 10 May 2004 21:41:53 +0100")
Message-ID: <87k6zkko6f.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <rsandifo@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040510204408.UArVCcW0SFJsoO-BdhMqS64B7LVoldZk-pbDOE8yMKE@z>

Richard Sandiford <rsandifo@redhat.com> writes:
> "Bradley D. LaRonde" <brad@laronde.org> writes:
>> I read this in the spec:
>>
>>     All externally visible symbols, both defined and undefined,
>>     must be hashed into the hash table.
>>
>> Should libpthread's malloc stub be added to the hash table?
>
> Yes.

Or, to be more precise, the symbol should be added to the hash table.
The fact that the symbol is lazily bound doesn't matter.

Richard
