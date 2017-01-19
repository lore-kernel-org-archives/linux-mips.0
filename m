Received: from mail-dm3nam03on0074.outbound.protection.outlook.com ([104.47.41.74]:40322
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990924AbdASRLPm1PM9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 19 Jan 2017 18:11:15 +0100
Subject: Re: [arm:phy-cleanup 10/10]
 arch/mips/cavium-octeon/octeon-platform.c:1064:15: error: expected
 declaration specifiers or '...' before string constant
References: <201701192138.NZ3q3lNY%fengguang.wu@intel.com>
 <20170119135452.GY27312@n2100.armlinux.org.uk>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <0605309c-5e79-ae31-8f37-bba722ba8354@caviumnetworks.com>
Date: Thu, 19 Jan 2017 09:11:06 -0800
MIME-Version: 1.0
In-Reply-To: <20170119135452.GY27312@n2100.armlinux.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
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
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: kbuild-all@01.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, kbuild test robot <fengguang.wu@intel.com>, linux-mips <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170119171106.FobkXeTI6uWUr8rmEufZYMAMY_OXOMDrxcKIxByLvGE@z>

On 01/19/2017 05:54 AM, Russell King - ARM Linux wrote:
> Hi David,
>
> Is there a reason why there's these MODULE_* macros at the bottom of
> this file?  From what I can see:
>
> (a) this file can't be built as a module as the Makefile doesn't allow it:
>     obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
>
> (b) this file will not be functional as a module anyway, because of the
>     multiple *_initcall() statements, each of which are translated to
>     a module_init() call, each of which define an alias to
>     int init_module(void) - and that will cause a build error.
>
> Can we just kill these, rather than adding a linux/module.h include to
> this file?

Yes, as you note, this file cannot be built as a module.

You can add: Acked-by: David Daney <david.daney@cavium.com> to a patch 
that removes the offending MODULE_*

Thanks for venturing into the murky world of MIPS,
David Daney

>
> Thanks.
>
> On Thu, Jan 19, 2017 at 09:08:42PM +0800, kbuild test robot wrote:
>> tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git phy-cleanup
>> head:   ef8cb7d5f838770f22cae0e20fee8d1157fc88fd
>> commit: ef8cb7d5f838770f22cae0e20fee8d1157fc88fd [10/10] net: dsa: remove unnecessary phy*.h includes
>> config: mips-cavium_octeon_defconfig (attached as .config)
>> compiler: mips64-linux-gnuabi64-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout ef8cb7d5f838770f22cae0e20fee8d1157fc88fd
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=mips
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/mips/cavium-octeon/octeon-platform.c:1064:15: error: expected declaration specifiers or '...' before string constant
>>     MODULE_AUTHOR("David Daney <ddaney@caviumnetworks.com>");
>>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/mips/cavium-octeon/octeon-platform.c:1065:16: error: expected declaration specifiers or '...' before string constant
>>     MODULE_LICENSE("GPL");
>>                    ^~~~~
>>    arch/mips/cavium-octeon/octeon-platform.c:1066:20: error: expected declaration specifiers or '...' before string constant
>>     MODULE_DESCRIPTION("Platform driver for Octeon SOC");
>>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> vim +1064 arch/mips/cavium-octeon/octeon-platform.c
>>
>> d617f9e9 David Daney   2013-12-03  1048  				break;
>> d617f9e9 David Daney   2013-12-03  1049  			default:
>> d617f9e9 David Daney   2013-12-03  1050  				break;
>> d617f9e9 David Daney   2013-12-03  1051  			}
>> d617f9e9 David Daney   2013-12-03  1052  		}
>> d617f9e9 David Daney   2013-12-03  1053  	}
>> d617f9e9 David Daney   2013-12-03  1054
>> 7ed18152 David Daney   2012-07-05  1055  	return 0;
>> 7ed18152 David Daney   2012-07-05  1056  }
>> 7ed18152 David Daney   2012-07-05  1057
>> 7ed18152 David Daney   2012-07-05  1058  static int __init octeon_publish_devices(void)
>> 7ed18152 David Daney   2012-07-05  1059  {
>> 7ed18152 David Daney   2012-07-05  1060  	return of_platform_bus_probe(NULL, octeon_ids, NULL);
>> 7ed18152 David Daney   2012-07-05  1061  }
>> 8074d782 Aaro Koskinen 2016-08-23  1062  arch_initcall(octeon_publish_devices);
>> 7ed18152 David Daney   2012-07-05  1063
>> 512254ba David Daney   2009-09-16 @1064  MODULE_AUTHOR("David Daney <ddaney@caviumnetworks.com>");
>> 512254ba David Daney   2009-09-16  1065  MODULE_LICENSE("GPL");
>> 512254ba David Daney   2009-09-16  1066  MODULE_DESCRIPTION("Platform driver for Octeon SOC");
>>
>> :::::: The code at line 1064 was first introduced by commit
>> :::::: 512254ba8383c5dd7eca6819d0da1ce2fe9ede47 MIPS: Octeon:  Move some platform device registration to its own file.
>>
>> :::::: TO: David Daney <ddaney@caviumnetworks.com>
>> :::::: CC: Ralf Baechle <ralf@linux-mips.org>
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>
>
>
