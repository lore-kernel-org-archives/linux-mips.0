Received: from mail-bn1blp0183.outbound.protection.outlook.com ([207.46.163.183]:30223
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6821198AbaEUGiHV7o90 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 08:38:07 +0200
Date: Wed, 21 May 2014 08:36:36 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 14/15] MIPS: paravirt: Update mips_paravirt_defconfig
Message-ID: <20140521063636.GC11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-15-git-send-email-andreas.herrmann@caviumnetworks.com>
 <2583927.Tb84BXCILT@radagast>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2583927.Tb84BXCILT@radagast>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20140521063636.cMsxLn3PG5vbTPeSOxU8JrREHUH_g-qcIMgQ5yhWIz0@z>

On Wed, May 21, 2014 at 12:17:37AM +0100, James Hogan wrote:
> On Tuesday 20 May 2014 16:47:15 Andreas Herrmann wrote:
> > Change CPU selection, enable SMP, enable almost all virtio options.
> 
> Looks like this should just be squashed into the previous patch if the 
> original defconfig was insufficient.

I'll merge it.


Andreas
