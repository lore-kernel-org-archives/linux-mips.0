Received: from mail-by2lp0237.outbound.protection.outlook.com ([207.46.163.237]:43477
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6859945AbaFTKlGR4mBK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 20 Jun 2014 12:41:06 +0200
Message-ID: <53A40FB0.2020503@ixiacom.com>
Date: Fri, 20 Jun 2014 13:40:48 +0300
From: Sorin Dumitru <sdumitru@ixiacom.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: n32: use compat getsockopt syscall
References: <1403250786-9763-1-git-send-email-sdumitru@ixiacom.com> <53A404D2.3030303@imgtec.com>
In-Reply-To: <53A404D2.3030303@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <sdumitru@ixiacom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20140620104048.TJTcfV5vDK4tVrGsIX26U-qrFxBtv8Lg8Z30WvjZvYo@z>



On 06/20/14 12:54, James Hogan wrote:
> On 20/06/14 08:53, Sorin Dumitru wrote:
>> Signed-off-by: Sorin Dumitru <sdumitru@ixiacom.com>
>
> A little more commit message wouldn't hurt. Did it break a particular
> program?

Yes, it was found by an internal program trying to get IP_PKTOPTIONS on 
a cavium octeon board.

Should I resubmit stating what was broken in the commit message?

Thanks,
Sorin
