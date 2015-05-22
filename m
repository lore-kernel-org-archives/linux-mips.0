Received: from mailapp01.imgtec.com ([195.59.15.196]:8157 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006628AbbEVTGPkM2mm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 21:06:15 +0200
Message-ID: <555F7E20.3040903@imgtec.com>
Date: Fri, 22 May 2015 12:06:08 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] MIPS: MSA: bugfix - disable MSA during thread switch
 correctly
References: <20150519211222.35859.52798.stgit@ubuntu-yegoshin> <20150519211351.35859.80332.stgit@ubuntu-yegoshin> <20150522093812.GH6941@linux-mips.org> <555F776E.3070904@imgtec.com>
In-Reply-To: <555F776E.3070904@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
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
Cc: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, paul.burton@imgtec.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150522190608.B-cf2VGNNXGf--mo6vHIrnJkzR1cvkIprrxdJs129os@z>

Ralf,

If there was TIF_USEDMSA in "prev" task then it means that all MSA HW is 
in use.
And switch_to() checks this and transfers it to resume() to indicate 
that MSA processing should be done.

Macro call "msa_save_all    a0" right before disabling MSA in Config5 
does a save of MSA registers. If it doesn't cause an exception then it 
means that Config5 does exist and Config5.MIPS_CONF5_MSAEN does exist too.

- Leonid.
