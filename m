Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:57028 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993104AbeGSVZwN2hAu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Jul 2018 23:25:52 +0200
Date: Thu, 19 Jul 2018 22:25:04 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH 0/3] MIPS: DSP ASE regset support
In-Reply-To: <20180719205630.osfdzk7gqv4djvqc@pburton-laptop>
Message-ID: <alpine.DEB.2.00.1807192214500.30992@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1804301557320.11756@tp.orcam.me.uk> <20180719205630.osfdzk7gqv4djvqc@pburton-laptop>
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-fsdevel@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180719212504.5wqzpE4g4_BwPc4HN9Q-1jAoQRv6FM0B5s53uD0cKF0@z>

Hi Paul,

> Thanks - applied to mips-next for 4.19, though I removed the stable tags
> on patches 1/3 & 3/3 & it's worth noting that the ELF note numbers are
> changed to from 0x70X to 0x80X, since 0x700 has been used already.

 Great, thanks!  No code has used the note numbers yet as I ran out of 
time for doing the GDB side, so the change is not going to affect 
anything.

> If you really care about a stable backport for 3/3 let's talk, but I'm
> doubtful as to its use when we've been missing this for so long.

 I guess it can be backported if a need arises.  There's been clearly some 
move on the 64-bit DSP side as indicated by this GDB bug report (mentioned 
previously): <https://sourceware.org/bugzilla/show_bug.cgi?id=22286>, 
which ultimately prompted me to write this patch series, however given 
that GDB has also been broken for years it looks like just the beginning.
So maybe people will cope with the requirement to upgrade.  They need to 
notice the missing GDB part first anyway. ;)

  Maciej
