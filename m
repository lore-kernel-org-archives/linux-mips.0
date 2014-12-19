Received: from mailapp01.imgtec.com ([195.59.15.196]:15278 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007783AbaLSIyj6BuL2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Dec 2014 09:54:39 +0100
Message-ID: <5493E7C8.4020302@imgtec.com>
Date: Fri, 19 Dec 2014 08:54:32 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 47/67] MIPS: kernel: branch: Prevent BEQL emulation
 for MIPS R6
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com> <1418915416-3196-48-git-send-email-markos.chandras@imgtec.com> <54936992.2070302@gentoo.org>
In-Reply-To: <54936992.2070302@gentoo.org>
Content-Type: text/plain; charset="windows-1252"
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
To: Joshua Kinard <kumba@gentoo.org>, linux-mips@linux-mips.org
Message-ID: <20141219085432.tiHHKNQKsdsvoRjFTzGWUHJSl-t_Yxjvn8qNOivbXcw@z>

On 12/18/2014 11:56 PM, Joshua Kinard wrote:
> On 12/18/2014 10:09, Markos Chandras wrote:
>> MIPS R6 removed the BEQL instruction so do not try to emulate it
>> if the R2-to-R6 emulator is not present.
> 
> How does this affect code for the old ISAs, MIPS-II to MIPS-IV?  I.e., the SGIs
> and the R10K CPUs that have to worry about the R10000_LLSC_WAR workaround and
> use branch-likely insns?
> 
> --J
> 

it does not affect them (or should not affect them). In case of *any*
non-R6 core, the NO_R6EMU macro is false, so all the conditionals here
are evaluated to false and the branch emulation will do the right thing.

-- 
markos
