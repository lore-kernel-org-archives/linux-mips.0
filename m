Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:35470 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991162AbeGPFpHaHU6D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Jul 2018 07:45:07 +0200
Date: Mon, 16 Jul 2018 06:44:23 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH 1/3] binfmt_elf: Respect error return from
 `regset->active'
In-Reply-To: <20180629171330.4giikc5x2cbxxuyc@pburton-laptop>
Message-ID: <alpine.DEB.2.00.1807151824230.30992@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1804301557320.11756@tp.orcam.me.uk> <alpine.DEB.2.00.1805102009380.10896@tp.orcam.me.uk> <20180629171330.4giikc5x2cbxxuyc@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <maciej.rozycki@uk.mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@mips.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-fsdevel@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180716054423.HKouxESJyobJnqnO4phekUSlVhnkrl2OYoYXY4cyz4I@z>

Hi Paul,

> > --- linux-jhogan-test.orig/fs/binfmt_elf.c	2018-03-21 17:14:55.000000000 +0000
> > +++ linux-jhogan-test/fs/binfmt_elf.c	2018-05-09 23:25:50.742255000 +0100
> > @@ -1739,7 +1739,7 @@ static int fill_thread_core_info(struct 
> >  		const struct user_regset *regset = &view->regsets[i];
> >  		do_thread_regset_writeback(t->task, regset);
> >  		if (regset->core_note_type && regset->get &&
> > -		    (!regset->active || regset->active(t->task, regset))) {
> > +		    (!regset->active || regset->active(t->task, regset) > 0)) {
> >  			int ret;
> >  			size_t size = regset_size(t->task, regset);
> >  			void *data = kmalloc(size, GFP_KERNEL);
> > 
> 
> This looks obviously right to me, although I don't think it affects
> anything until commit 25847fb195ae ("powerpc/ptrace: Enable support for
> NT_PPC_CGPR") in v4.8-rc1 & even then not in a harmful way so I'd drop
> the stable tag.

 I'm fine with dropping the tag FWIW.  Thanks for taking care of my patch.

  Maciej
