Received: from mailapp01.imgtec.com ([195.59.15.196]:43139 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008667AbbAUSCNpzwD7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 19:02:13 +0100
Date: Wed, 21 Jan 2015 10:02:00 -0800
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH] MIPS: kernel: cps-vec: Replace "addi" with "addiu"
Message-ID: <20150121180200.GC15278@NP-P-BURTON>
References: <1421854030-28929-1-git-send-email-markos.chandras@imgtec.com>
 <54BFE91F.7050906@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <54BFE91F.7050906@gmail.com>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, "Maciej W. Rozycki" <macro@linux-mips.org>, stable@vger.kernel.org
Message-ID: <20150121180200.VNCOxNeoUZAY2DlOaSK5Nuy4UBTyBtr3MqCeK9bVoQw@z>

On Wed, Jan 21, 2015 at 09:59:59AM -0800, David Daney wrote:
> On 01/21/2015 07:27 AM, Markos Chandras wrote:
> >The "addi" instruction will trap on overflows which is not something
> >we need in this code, so we replace that with "addiu".
> >
> >Link: http://www.linux-mips.org/archives/linux-mips/2015-01/msg00430.html
> >Cc: Maciej W. Rozycki <macro@linux-mips.org>
> >Cc: <stable@vger.kernel.org> # v3.15+
> >Cc: Paul Burton <paul.burton@imgtec.com>
> >Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> 
> Acked-by: David Daney <david.daney@cavium.com>
> 
> Same comment about the stable thing.  Is it needed for anything other than
> follow-on MIPS r6 Patches?

In both this & the MSA asmmacro.h cases, the additions should never
cause overflow. So I agree, backporting to stable seems like overkill.

Paul

> 
> >---
> >Moving this out of the R6 patchset as requested by Maciej
> >---
> >  arch/mips/kernel/cps-vec.S | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> [...]
