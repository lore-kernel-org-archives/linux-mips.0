Received: from mailapp01.imgtec.com ([195.59.15.196]:45365 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817074AbaFTKurRwkTL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Jun 2014 12:50:47 +0200
Message-ID: <53A411FF.5070505@imgtec.com>
Date: Fri, 20 Jun 2014 11:50:39 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: n32: use compat getsockopt syscall
References: <1403250786-9763-1-git-send-email-sdumitru@ixiacom.com> <53A404D2.3030303@imgtec.com> <53A40FB0.2020503@ixiacom.com>
In-Reply-To: <53A40FB0.2020503@ixiacom.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sorin Dumitru <sdumitru@ixiacom.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20140620105039.j26bPqpJQsLG2WBlc4z_Dbisa2-OPhg3xMpA03Parfs@z>

On 20/06/14 11:40, Sorin Dumitru wrote:
> On 06/20/14 12:54, James Hogan wrote:
>> On 20/06/14 08:53, Sorin Dumitru wrote:
>>> Signed-off-by: Sorin Dumitru <sdumitru@ixiacom.com>
>>
>> A little more commit message wouldn't hurt. Did it break a particular
>> program?
> 
> Yes, it was found by an internal program trying to get IP_PKTOPTIONS on
> a cavium octeon board.
> 
> Should I resubmit stating what was broken in the commit message?

Yeh, if you don't mind. I think it's useful to know exactly why a change
was made and what it fixes when later digging through the git history
(e.g. commit 515c7af85ed9 is a great example of that).

Thanks
James
