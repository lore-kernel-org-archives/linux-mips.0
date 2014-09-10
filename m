Received: from mailapp01.imgtec.com ([195.59.15.196]:63717 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008655AbaIJJOpEiPRr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Sep 2014 11:14:45 +0200
Message-ID: <5410167C.2070305@imgtec.com>
Date: Wed, 10 Sep 2014 10:14:36 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH linux-next] MIPS: ioctls: Add missing TIOC{S,G}RS485 definitions
References: <1410263575-26720-1-git-send-email-markos.chandras@imgtec.com> <20140909191736.GA7467@kroah.com> <54100AE5.6050401@imgtec.com> <CAPybu_128PsDN7wywntyTuCCfenBWTiS60P2g6_Hk68EMQc1CQ@mail.gmail.com> <54100FB0.1000308@imgtec.com> <CAPybu_03BDC5+d5-Wmwz+x==5sbKHgU8Rr0JimK16yRnN65x8Q@mail.gmail.com>
In-Reply-To: <CAPybu_03BDC5+d5-Wmwz+x==5sbKHgU8Rr0JimK16yRnN65x8Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-mips@linux-mips.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org
Message-ID: <20140910091436.ReWzF0auG-mt8XF25tMKVjD8HgbYpVcLqVKHZMiPuLY@z>

On 09/10/2014 10:05 AM, Ricardo Ribalda Delgado wrote:
> Hello Markos
> 
> Sorry for the mess. I have already send a new patch for mips using the
> _IO* macros
> 
> Just to put things a bit into context:
> 
> I did made the patch for serial and tested it only in x86. I wrongly
> infer that the IOCTLS were defined for all the arches (sorry :S)
> 
> Then when the patch was applied on tty-next the build-bot throw some
> errors for xtensa, that I fixed without using the IO_ macros
> 
> Then you came with your patch,
> 
> I realized that this could be wrong for mor arches, so I check the
> rest and make patches for them.
> 
> Greg then pointed out that I should use _IO instead of numbers, so I
> remade my patches using the _IO macros. I did not want to step into
> your patch so I did not prepare a new one for mips
> 
> All the _IO patches (except mips) are now merged into tty-next.
> 
> Hopefully that one also get merged soon :)
> 
> 
> Thanks for your help and sorry for any disturbance.
> 
> 

Hi Ricardo,

No problem :) Thanks for taking care of that

-- 
markos
