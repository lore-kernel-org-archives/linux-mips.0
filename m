Received: from mailapp01.imgtec.com ([195.59.15.196]:35177 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993156AbdGUQK63BFD9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Jul 2017 18:10:58 +0200
Subject: Re: [PATCH] MIPS: OCTEON: Fix USB platform code breakage.
References: <1496250830-26716-1-git-send-email-steven.hill@cavium.com>
 <20170719094143.GS31455@jhogan-linux.le.imgtec.org>
 <d8c33b8e-e57c-f109-7747-fdddbcc7bd0e@cavium.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <bce34cc9-38a2-1fce-3569-65742dc068ad@imgtec.com>
Date: Fri, 21 Jul 2017 17:10:52 +0100
MIME-Version: 1.0
In-Reply-To: <d8c33b8e-e57c-f109-7747-fdddbcc7bd0e@cavium.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <Steven.Hill@cavium.com>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170721161052.qHnGXOZx5ifCnpn9RIkWCESaJL7NHPKEFoqoU43w8CU@z>

Hi Steven


On 19/07/17 16:31, Steven J. Hill wrote:
> On 07/19/2017 04:41 AM, James Hogan wrote:
>> Is this already fixed in some other way or is it some unusual configuration? I couldn't reproduce any failure on 4.12 and you haven't quoted the build error or explained what was missing that required io.h to be included.
>>
> It appears things are working fine in 4.12, so I have dropped
> this patch.
>

This is indeed still broken in v4.13-rc1 with some configurations:

   CC      arch/mips/cavium-octeon/octeon-usb.o
arch/mips/cavium-octeon/octeon-usb.c: In function ‘dwc3_octeon_device_init’:
arch/mips/cavium-octeon/octeon-usb.c:540:4: error: implicit declaration 
of function ‘devm_iounmap’ [-Werror=implicit-function-declaration]
     devm_iounmap(&pdev->dev, base);
     ^
cc1: some warnings being treated as errors
scripts/Makefile.build:302: recipe for target 
'arch/mips/cavium-octeon/octeon-usb.o' failed

Thanks,
Matt
