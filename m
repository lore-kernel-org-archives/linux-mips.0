Received: from multi.imgtec.com ([194.200.65.239]:60254 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835275Ab3FMVA3kYc0S (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 13 Jun 2013 23:00:29 +0200
Message-ID: <51BA32E3.7090006@imgtec.com>
Date: Thu, 13 Jun 2013 16:00:19 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: sead3: Fix incorrect values for soft reset.
References: <1371075656-21374-1-git-send-email-Steven.Hill@imgtec.com> <20130613141820.GB22906@linux-mips.org>
In-Reply-To: <20130613141820.GB22906@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
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
Message-ID: <20130613210019.hSaVMQxWtFgdy6L3VFMM5G8R2b9NO-LnkA60Mt8IrT0@z>

On 06/13/2013 09:18 AM, Ralf Baechle wrote:
> On Wed, Jun 12, 2013 at 05:20:56PM -0500, Steven J. Hill wrote:
>
> I think this is going to break Malta.  We used to have:
>
>      #define SOFTRES_REG       0x1e800050
>      #define GORESET           0x4d
>
> for SEAD
>
Yes, it does break Malta. The #define values are defined in two places 
and I missed one of them. I have submitted a patchset to these cleaned 
up. Both platforms can now perform soft resets. Also, the 0x1e800050 is 
not correct. I check all the way back in our 2.6.32.15 tree and that 
value does not show up anywhere. The value in the patchset for SEAD-3 is 
the correct one.

-Steve
