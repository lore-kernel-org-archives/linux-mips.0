Received: from mailapp01.imgtec.com ([195.59.15.196]:53367 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029648AbcEQNocw6PVc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 15:44:32 +0200
Date: Tue, 17 May 2016 14:44:19 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: MSA: Fix a link error on `_init_msa_upper' with
 older GCC
In-Reply-To: <20160517131654.GI14481@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1605171440100.6794@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1605162325170.6794@tp.orcam.me.uk> <20160517131654.GI14481@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20160517134419.OhhPGJ5IMlHBQu7TPoM0VZF0uOd88s6gUCX3_LRHjBc@z>

On Tue, 17 May 2016, Ralf Baechle wrote:

> > --- a/vmlinux.dump	2016-05-17 01:01:03.655891000 +0100
> > +++ b/vmlinux.dump	2016-05-17 02:11:49.264564000 +0100
> 
> Applied with this junk segment dropped.

 Ah, I didn't realise it would confuse `git am' -- otherwise I would have 
escaped it or mangled somehow.  Thanks for taking care of it then.

  Maciej
