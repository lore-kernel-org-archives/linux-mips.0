Received: from mail-bn1on0099.outbound.protection.outlook.com ([157.56.110.99]:42176
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27007055AbbBYQJJalW5c (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 25 Feb 2015 17:09:09 +0100
Message-ID: <54EDF39A.1080002@caviumnetworks.com>
Date: Wed, 25 Feb 2015 08:08:58 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: octeon disable SWIOTLB
References: <20150225144128.GB27513@fifo99.com>
In-Reply-To: <20150225144128.GB27513@fifo99.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: dwalker@fifo99.com
Cc: linux-mips@linux-mips.org
Message-ID: <20150225160858.8QI9DcP1mD2NcRitShMFk2XhkG0IrYIVw-qZnzSJw90@z>

On 02/25/2015 06:41 AM, dwalker@fifo99.com wrote:
> Hi,
>
> Back in 2010 you made CONFIG_SWIOTLB mandatory (commit b93b2a). This prevents the Continuous
> memory allocation from being enabled. Would you be willing to accept a patch which allows
> this option to be disabled if CONFIG_EXPERT is set?

Ralf has the final say, so it really is not up to me.

That said, any patch that improves the flexibility of the kernel without 
adversely effecting reliability and correctness would be welcome.


> I suspect some users of Octeon can
> review their hardware to be sure it's save to do.
>
> Daniel
>
>
