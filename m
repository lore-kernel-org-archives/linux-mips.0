Message-ID: <001201c12a29$57f3b660$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <000701c12529$e1640580$8021690a@huawei.com> <20010815103314.A11966@bacchus.dhis.org> <000b01c1295e$0f2174c0$8021690a@huawei.com> <20010820230755.A11242@dea.linux-mips.net> <001501c129dd$8acebb80$8021690a@huawei.com> <20010821083508.A13302@dea.linux-mips.net>
Subject: Re: questions about eret....
Date: Tue, 21 Aug 2001 18:09:19 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010821100919.mnuKEVq94DaQmvPfCsKuE93ZMCfNj7qGhuA6CUD06t4@z>


>
> > > >     I have a question to ask about eret.
> > > >
> > > >     In RC4xxx/RC32334, after eret finished, does it automatically
enable
> > IE
> > > > bit of STATUS register?
> > >
> > > ERET does not influence the state of the IE bit.
> >
> > I agree with you, but the RC32334 User manual (14-13 section) say  it
does
> > and say we must run a "CLI" just before eret to disable IE bit in Status
> > register .
>
> That has a different reason.  Eret takes the return address from the
> EPC register and if you'd take an exception between restoring that and the
> eret you'd loose it's content - crash boom bang.

Yes.
But in the sourece codes, when we finish the exception handlers , we will
run "ret_from_irq" (ret_from_sys_call) in the entry.S and then run macro
"RESTORE_ALL_AND_RET".  The macro does restore all registers and then ERET.
But there is not a "CLI" just before ERET as the user manual suggested. Why?
so when we handle a syscall exception, we do "STI" in the handle_sys(). and
when ret_from_sys_call and we will run this macro "RESTORE_ALL_AND_RET".
because there is not a "CLI" just before ERET , is it possible to have some
problems?

machael thailer
