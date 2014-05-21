Received: from mail-bl2lp0211.outbound.protection.outlook.com ([207.46.163.211]:14013
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6842298AbaEUGYKS4Rer (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 08:24:10 +0200
Date: Wed, 21 May 2014 08:22:10 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 03/15] MIPS: OCTEON: Move CAVIUM_OCTEON_CVMSEG_SIZE to
 CPU_CAVIUM_OCTEON
Message-ID: <20140521062210.GA11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-4-git-send-email-andreas.herrmann@caviumnetworks.com>
 <3124276.AVUgu1xWyv@radagast>
 <537BE3D7.1070904@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537BE3D7.1070904@caviumnetworks.com>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521062210.8qau6E69j-DXC5JIMwwPq0DcS8jDaJP8e18uStYJeac@z>

On Tue, May 20, 2014 at 04:23:03PM -0700, David Daney wrote:
> On 05/20/2014 03:52 PM, James Hogan wrote:
> >Hi Andreas,
> >
> >On Tuesday 20 May 2014 16:47:04 Andreas Herrmann wrote:
> >>From: David Daney <david.daney@cavium.com>
> >>
> >>CVMSEG is related to the CPU core not the SoC system.  So needs to be
> >>configurable there.
> >>
> >>Signed-off-by: David Daney <david.daney@cavium.com>
> >>Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> >>---
> >>  arch/mips/cavium-octeon/Kconfig |   30 ++++++++++++++++++++----------
> >>  1 file changed, 20 insertions(+), 10 deletions(-)
> >>
> >>diff --git a/arch/mips/cavium-octeon/Kconfig
> >>b/arch/mips/cavium-octeon/Kconfig index 227705d..c5e9975 100644
> >>--- a/arch/mips/cavium-octeon/Kconfig
> >>+++ b/arch/mips/cavium-octeon/Kconfig
> [...]
> >>-config CAVIUM_OCTEON_CVMSEG_SIZE
> >>-	int "Number of L1 cache lines reserved for CVMSEG memory"
> >>-	range 0 54
> >>-	default 1
> >>+config CAVIUM_OCTEON_HW_FIX_UNALIGNED
> >>+	bool "Enable hardware fixups of unaligned loads and stores"
> >>+	default "y"
> >
> >Is adding CAVIUM_OCTEON_HW_FIX_UNALIGNED in this patch intentional? It seems
> >unrelated.
> >
> 
> Good catch.  CAVIUM_OCTEON_HW_FIX_UNALIGNED and its users were
> removed, we shouldn't add it back.  I think this is a case of
> rebasing gone wrong.


Oops, sorry, that wasn't intentional.
James, thanks for catching this.


Andreas
