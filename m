Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCF5C636D7
	for <linux-mips@archiver.kernel.org>; Tue, 21 Feb 2023 19:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjBUTfR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 21 Feb 2023 14:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjBUTfQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 14:35:16 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E887B1632D;
        Tue, 21 Feb 2023 11:35:11 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D5931650;
        Tue, 21 Feb 2023 11:35:54 -0800 (PST)
Received: from [10.57.13.181] (unknown [10.57.13.181])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0C13F703;
        Tue, 21 Feb 2023 11:35:09 -0800 (PST)
Message-ID: <54f204eb-79b5-5c1c-fffb-696939644d8c@arm.com>
Date:   Tue, 21 Feb 2023 19:35:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/7] dma-mapping: Always provide dma_default_coherent
Content-Language: en-GB
To:     Christoph Hellwig <hch@lst.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de,
        mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
        robh+dt@kernel.org, m.szyprowski@samsung.com
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221124613.2859-5-jiaxun.yang@flygoat.com>
 <20230221175813.GC15247@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230221175813.GC15247@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2023-02-21 17:58, Christoph Hellwig wrote:
> On Tue, Feb 21, 2023 at 12:46:10PM +0000, Jiaxun Yang wrote:
>> dma_default_coherent can be useful for determine default coherency
>> even on arches without noncoherent support.
> 
> How?

Indeed, "default" is conceptually meaningless when there is no possible 
alternative :/

Robin.
