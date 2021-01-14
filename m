Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C29C433E0
	for <linux-mips@archiver.kernel.org>; Thu, 14 Jan 2021 11:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 236CF239A1
	for <linux-mips@archiver.kernel.org>; Thu, 14 Jan 2021 11:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbhANLWG (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 14 Jan 2021 06:22:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2343 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbhANLWF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 06:22:05 -0500
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DGhdC5q3Tz67c3T;
        Thu, 14 Jan 2021 19:18:23 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 14 Jan 2021 12:21:23 +0100
Received: from [10.210.171.141] (10.210.171.141) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 14 Jan 2021 11:21:23 +0000
Subject: Re: logical PIO code for mips question (was Re: [PATCH RESEND v3 3/3]
 MIPS: Loongson64: Enable PCI_IO_VMMAP)
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
CC:     <chenhc@lemote.com>, <tsbogend@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-3-jiaxun.yang@flygoat.com>
 <1a21eaf7-52c0-c032-4405-1b6916628ade@huawei.com>
 <05b37da0-aabd-941f-6fff-47c3b46c95d2@flygoat.com>
 <797e574a-e4fe-df6c-f352-6a5a239c32de@huawei.com>
 <83748d12-eee2-686a-e12d-2abf19aeccd0@flygoat.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <ac236e82-b61b-8f8f-ddfc-78723154b8c9@huawei.com>
Date:   Thu, 14 Jan 2021 11:20:13 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <83748d12-eee2-686a-e12d-2abf19aeccd0@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.171.141]
X-ClientProxiedBy: lhreml714-chm.china.huawei.com (10.201.108.65) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/01/2021 11:10, Jiaxun Yang wrote:
> Not yet.
> 
>>
>> I may just do this (reserve 64K) under INDIRECT_PIO for now, not sure 
>> yet.
> 
> Probably we can make the first page of LOGIC_PIO a special region. It 
> could be a
> reserved region when no legacy ISA bus present or overlay by MMIO in 
> case like
> MIPS here.

Yeah, I could do that as well, but then I need special handling for that 
region, which may complicate things.

Anyway, I'll cc you and linux-mips on any patch.

Thanks,
John
