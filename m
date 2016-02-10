Received: from mailapp01.imgtec.com ([195.59.15.196]:54028 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010267AbcBJOU3eSecf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Feb 2016 15:20:29 +0100
Date: Wed, 10 Feb 2016 14:20:22 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 1/6] MIPS: BMIPS: Disable pref 30 for buggy CPUs
In-Reply-To: <20160210092216.GC10352@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1602101415220.15885@tp.orcam.me.uk>
References: <1455051354-6225-1-git-send-email-f.fainelli@gmail.com> <1455051354-6225-2-git-send-email-f.fainelli@gmail.com> <20160210092033.GB10352@linux-mips.org> <20160210092216.GC10352@linux-mips.org>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org, blogic@openwrt.org, cernekee@gmail.com, jon.fraser@broadcom.com, pgynther@google.com, paul.burton@imgtec.com, ddaney.cavm@gmail.com
Message-ID: <20160210142022.zcySPLFK7wVFJtXV49ZmLfYUhXc4rAJgETkWdA5glSM@z>

On Wed, 10 Feb 2016, Ralf Baechle wrote:

> > And why do both MFC0 and MTC0 instructions above have the same opcode?
> 
> Forget this one, I should occasionally open my eyes in the morning ;)

 Yeah, I think we've beaten it with Florian all to death last night 
already.

  Maciej
