Received: from szxga02-in.huawei.com ([119.145.14.65]:17467 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816906Ab3EQEuWN-Ul3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 May 2013 06:50:22 +0200
Message-ID: <5195B6D6.7030504@huawei.com>
Date: Fri, 17 May 2013 12:49:26 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: omap2430: fix memleak in err case
References: <5192E650.3070303@huawei.com> <519377C4.1040800@cogentembedded.com>
In-Reply-To: <519377C4.1040800@cogentembedded.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <libo.chen@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20130517044926.xLXd9tkkjpwAqtCZ9siaO-NpK6kHOSU8i5PASYnEqro@z>

On 2013/5/15 19:55, Sergei Shtylyov wrote:
> Hello.
> 
> On 15-05-2013 5:35, Libo Chen wrote:
> 
>> when omap_get_control_dev fail, we should release relational platform_device
> 
>    s/fail/fails/, s/relational/related/?
> 
>> Signed-off-by: Libo Chen <libo.chen@huawei.com>
> 
>    You've posted this to the wrong mailing list, linux-mips; devicetree-discuss also seems hardly related.
> 
> WBR, Sergei
> 
> 
> 

Hi Sergei,

Thank you for your remind.
