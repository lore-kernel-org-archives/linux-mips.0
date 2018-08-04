Received: from mail-qt0-x243.google.com ([IPv6:2607:f8b0:400d:c0d::243]:41048
        "EHLO mail-qt0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994551AbeHDVDTNcmTO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 4 Aug 2018 23:03:19 +0200
Received: by mail-qt0-x243.google.com with SMTP id e19-v6so9871414qtp.8
        for <linux-mips@linux-mips.org>; Sat, 04 Aug 2018 14:03:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180804124309.GB4920@kroah.com>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
 <20180803030237.3366-15-songjun.wu@linux.intel.com> <20180803055640.GA32226@kroah.com>
 <763bba56-3701-7fe9-9b31-4710594b40d5@linux.intel.com> <20180803103023.GA6557@kroah.com>
 <3360edd2-f3d8-b860-13fa-ce680edbfd0a@hauke-m.de> <20180804124309.GB4920@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 4 Aug 2018 23:03:11 +0200
Message-ID: <CAK8P3a3qs34LuhPeaef2wPHYEWbYO5N-4n7763BcaDyppiJ6DA@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] serial: intel: Add CCF support
Content-Type: text/plain; charset="UTF-8"
Return-Path: <arndbergmann@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, "Wu, Songjun" <songjun.wu@linux.intel.com>, hua.ma@linux.intel.com, yixin.zhu@linux.intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-clk <linux-clk@vger.kernel.org>, linux-serial@vger.kernel.org, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>
Message-ID: <20180804210311.F3CddLd8zRyoE-gQ-Aditwu_OK1fwhtz_e4p1um7qjA@z>

On Sat, Aug 4, 2018 at 2:43 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Aug 04, 2018 at 12:54:22PM +0200, Hauke Mehrtens wrote:
>> On 08/03/2018 12:30 PM, Greg Kroah-Hartman wrote:
>> > On Fri, Aug 03, 2018 at 03:33:38PM +0800, Wu, Songjun wrote:

>> This patch makes it possible to use it with the legacy lantiq code and
>> also with the common clock framework. I see multiple options to fix this
>> problem.
>>
>> 1. The current approach to have it as a compile variant for a) legacy
>> lantiq arch code without common clock framework and b) support for SoCs
>> using the common clock framework.
>> 2. Convert the lantiq arch code to the common clock framework. This
>> would be a good approach, but it need some efforts.
>> 3. Remove the arch/mips/lantiq code. There are still users of this code.
>> 4. Use the old APIs also for the new xRX500 SoC, I do not like this
>> approach.
>> 5. Move lantiq_soc.h to somewhere in include/linux/ so it is globally
>> available and provide some better wrapper code.
>
> I don't really care what you do at this point in time, but you all
> should know better than the crazy #ifdef is not allowed to try to
> prevent/allow the inclusion of a .h file.  Checkpatch might have even
> warned you about it, right?
>
> So do it correctly, odds are #5 is correct, as that makes it work like
> any other device in the kernel.  You are not unique here.

The best approach here would clearly be 2. We don't want platform
specific header files for doing things that should be completely generic.

Converting lantiq to the common-clk framework obviously requires
some work, but then again the whole arch/mips/lantiq/clk.c file
is fairly short and maybe not that hard to convert.
