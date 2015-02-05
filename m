Received: from mga02.intel.com ([134.134.136.20]:31939 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27012652AbbBEUpszPHjM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Feb 2015 21:45:48 +0100
From: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Subject: RE: [next:master 4658/4676] undefined reference to `copy_user_page'
Date: Thu, 5 Feb 2015 20:45:26 +0000
Message-ID: <100D68C7BA14664A8938383216E40DE0408569A1@FMSMSX114.amr.corp.intel.com>
References: <201501221315.sbz4rdsB%fengguang.wu@intel.com>
        <100D68C7BA14664A8938383216E40DE040853FB4@FMSMSX114.amr.corp.intel.com>
        <20150205122115.8fe1037870b76d75afc3fb03@linux-foundation.org>
        <100D68C7BA14664A8938383216E40DE040856952@FMSMSX114.amr.corp.intel.com>
 <20150205122552.1485c1439ec6c019e9443c51@linux-foundation.org>
In-Reply-To: <20150205122552.1485c1439ec6c019e9443c51@linux-foundation.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <matthew.r.wilcox@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Wu, Fengguang" <fengguang.wu@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Linux Memory Management List <linux-mm@kvack.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-arm-kernel@lists.arm.linux.org.uk" <linux-arm-kernel@lists.arm.linux.org.uk>
Message-ID: <20150205204526.L88XiYx42W_unVl5VImo9K8vL3kHmtYSsB0mlV_XfLc@z>

MIPS: https://lkml.org/lkml/2015/1/31/1
ARM: https://marc.info/?l=linaro-kernel&m=142253251904005&w=3

-----Original Message-----
From: Andrew Morton [mailto:akpm@linux-foundation.org] 
Sent: Thursday, February 05, 2015 12:26 PM
To: Wilcox, Matthew R
Cc: Wu, Fengguang; kbuild-all@01.org; Linux Memory Management List; linux-mips@linux-mips.org; linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: [next:master 4658/4676] undefined reference to `copy_user_page'

On Thu, 5 Feb 2015 20:22:34 +0000 "Wilcox, Matthew R" <matthew.r.wilcox@intel.com> wrote:

> 
> -----Original Message-----
> From: Andrew Morton [mailto:akpm@linux-foundation.org] 
> Sent: Thursday, February 05, 2015 12:21 PM
> To: Wilcox, Matthew R
> Cc: Wu, Fengguang; kbuild-all@01.org; Linux Memory Management List; linux-mips@linux-mips.org; linux-arm-kernel@lists.arm.linux.org.uk
> Subject: Re: [next:master 4658/4676] undefined reference to `copy_user_page'
> 
> On Thu, 22 Jan 2015 15:12:15 +0000 "Wilcox, Matthew R" <matthew.r.wilcox@intel.com> wrote:
> 
> > Looks like mips *declares* copy_user_page(), but never *defines* an implementation.
> > 
> > It's documented in Documentation/cachetlb.txt, but it's not (currently) called if the architecture defines its own copy_user_highpage(), so some bitrot has occurred.  ARM is currently fixing this, and MIPS will need to do the same.
> > 
> > (We can't use copy_user_highpage() in DAX because we don't necessarily have a struct page for 'from'.)
> 
> > Has there been any progress on this?  It would be unpleasant to merge
> > DAX into 3.19 and break MIPS and ARM.
>
> Yes, both MIPS and ARM have sent patches out for this.

I'm not seeing either in linux-next.
