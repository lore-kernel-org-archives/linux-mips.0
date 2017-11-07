Received: from mail-by2nam01on0085.outbound.protection.outlook.com ([104.47.34.85]:6043
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992240AbdKGRwuZTohx (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 7 Nov 2017 18:52:50 +0100
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com>
 <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <2a051ef8-d383-ffd9-e79b-34a2701e44c9@caviumnetworks.com>
Date: Tue, 7 Nov 2017 09:52:36 -0800
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Arnd Bergmann <arnd@arndb.de>, "kernelci.org bot" <bot@kernelci.org>, Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <steven.hill@cavium.com>, James Hogan <james.hogan@mips.com>
Cc: Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Message-ID: <20171107175236.Pw5eFb7-Ds05e546gKjyRY5jS7UQ3KIA-W7MrcLDp_w@z>

On 11/07/2017 04:15 AM, Arnd Bergmann wrote:
> On Tue, Nov 7, 2017 at 7:59 AM, kernelci.org bot <bot@kernelci.org> wrote:
> 
>> Errors summary:
>> 20 arch/mips/include/asm/smp.h:32:29: error: 'CONFIG_MIPS_NR_CPU_NR_MAP' undeclared here (not in a function)
> 
> I have reported this before, as did 0day, but I don't know if anyone
> is fixing this:
> 
>

Yes, Steven sent a patch to fix this back on Oct. 2:

https://patchwork.linux-mips.org/patch/17400/

Ralf seems AWOL with respect to this issue.

Perhaps the alternate MIPS maintainer James Hogan can try to get the fix 
merged.

David Daney
