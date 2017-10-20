Received: from 20pmail.ess.barracuda.com ([64.235.150.246]:40457 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992181AbdJTUtFup5ML (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Oct 2017 22:49:05 +0200
Date: Fri, 20 Oct 2017 21:47:51 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: kernel: proc: Remove spurious white space in
 cpuinfo
In-Reply-To: <1508509203-30661-1-git-send-email-aleksandar.markovic@rt-rk.com>
Message-ID: <alpine.DEB.2.00.1710202129250.3886@tp.orcam.me.uk>
References: <1508509203-30661-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Dragan Cecavac <dragan.cecavac@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>, Miodrag Dinic <miodrag.dinic@mips.com>, Paul Burton <paul.burton@imgtec.com>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171020204751.rgZggcaKnm6kvCYFpLzIHCXTIqb4j4iKjYiUrRfaEW0@z>

On Fri, 20 Oct 2017, Aleksandar Markovic wrote:

> Remove unnecessary space from FPU info segment of /proc/cpuinfo.

 NAK.  As I recall back in Nov 2001 I placed the extra space there to 
visually separate the CPU part from the FPU part, e.g.:

cpu model		: R3000A V3.0  FPU V4.0
cpu model		: SiByte SB1 V0.2  FPU V0.2

etc.  And the motivation behind it still stands.  Please remember that 
/proc/cpuinfo is there for live humans to parse and grouping all these 
pieces together would make it harder.  Which means your change adds no 
value I'm afraid.

 NB regrettably back in those days much of the patch traffic happened off 
any mailing list, however I have quickly tracked down my archival copy of 
the original submission of the change introducing this piece of code and
I'll be happy to share it with anyone upon request.

  Maciej
