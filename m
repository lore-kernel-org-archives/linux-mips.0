Message-ID: <001b01c198ba$0fc82b00$9b6e0b0a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <003301c198af$1c0d0a80$9b6e0b0a@huawei.com> <20020109015128.GB23506@conectiva.com.br> <000f01c198b6$d627ffe0$9b6e0b0a@huawei.com> <20020109024443.GD23506@conectiva.com.br>
Subject: Re: limited Memory question...
Date: Wed, 9 Jan 2002 11:02:23 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020109030223.QwA7-PYwZwivlUG1VzizSArrMwwi6bO-djyah03pWq4@z>


> Em Wed, Jan 09, 2002 at 10:39:18AM +0800, machael thailer escreveu:
> > > > I have a question to need you help. Our MIPS-based custom board has only
> > > > 8M memory.When I want to insmod a 24M module, it often panics and says
> > > > "out of memory...".
> > > 
> > > a kernel module? 24MiB? ouch, if that is the case, the only way is to get
> > > more memory for your board, as kernel memory is not swappable...
> > 
> > Yes, it is a kernel module.  
> > But unfortunately, the memory is fixed on our board and we cannot add more memory.
> > Any other ideas?
> 
> What does this module does that takes so much memory? One possible idea
> akpm talked about was to reduce NR_CPUS to the number of CPUs in your eval
> board if that is something relevant to the reason why your module takes so
> much memory, does it have a firmware linked? If so, don't link it and load
> it from userspace, block by block, if this is possible, etc, other than
> these suggestions one could only give more ideas if the source code is
> available for review.

24M is the size of the module, not the memory that it takes.

machael.
