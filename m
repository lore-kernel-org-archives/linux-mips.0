Message-ID: <001501c129dd$8acebb80$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <000701c12529$e1640580$8021690a@huawei.com> <20010815103314.A11966@bacchus.dhis.org> <000b01c1295e$0f2174c0$8021690a@huawei.com> <20010820230755.A11242@dea.linux-mips.net>
Subject: Re: questions about eret....
Date: Tue, 21 Aug 2001 09:06:43 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010821010643.GTf4ZT11aoufSE15mHMqm5VBIyTnLcZXUCeiZIeS76g@z>


----- Original Message -----
From: "Ralf Baechle" <ralf@oss.sgi.com>
To: "machael thailer" <dony.he@huawei.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Tuesday, August 21, 2001 5:07 AM
Subject: Re: questions about eret....


> On Mon, Aug 20, 2001 at 05:54:09PM +0800, machael thailer wrote:
>
> >     I have a question to ask about eret.
> >
> >     In RC4xxx/RC32334, after eret finished, does it automatically enable
IE
> > bit of STATUS register?
>
> ERET does not influence the state of the IE bit.

I agree with you, but the RC32334 User manual (14-13 section) say  it does
and say we must run a "CLI" just before eret to disable IE bit in Status
register .

machael thailer
