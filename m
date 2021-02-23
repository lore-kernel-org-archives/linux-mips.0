Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AACDC433E0
	for <linux-mips@archiver.kernel.org>; Tue, 23 Feb 2021 16:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C27A764E62
	for <linux-mips@archiver.kernel.org>; Tue, 23 Feb 2021 16:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhBWQ1B (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 23 Feb 2021 11:27:01 -0500
Received: from linux.microsoft.com ([13.77.154.182]:45978 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhBWQ1B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 11:27:01 -0500
Received: from [192.168.0.114] (unknown [49.207.208.227])
        by linux.microsoft.com (Postfix) with ESMTPSA id 5988820B6C40;
        Tue, 23 Feb 2021 08:26:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5988820B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1614097579;
        bh=rgm+/skqLaNd7iHFRgkr7ujP2+6UCRA1yFShyxec1jY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lf4sWGLLPk44GWLVBceyKSvrSqpY3QJTFmZuXPgN8DBoeCzp3w5f34tPLcES1g2+9
         40MDhiURkmlff0O75wrSP3dW0uFIvOi/TUTtAO0YQBOJwQ1/eXhwOA3zoHgzRfNMib
         dbeMQSJvu0iCpjo74UV4Osgyl0RtvS+6JozOqh20=
Subject: Re: [PATCH 1/2] optee: fix tee out of memory failure seen during
 kexec reboot
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        allen.lkml@gmail.com, zajec5@gmail.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20210217092714.121297-2-allen.lkml@gmail.com>
 <20210217092714.121297-2-allen.lkml@gmail.com>
 <8d87655f-27c6-6a66-6eb0-9244279fbf2c@linux.microsoft.com>
 <20210223081948.GA1836717@jade>
From:   Allen Pais <apais@linux.microsoft.com>
Message-ID: <cbc963d5-6c4b-7e69-4a9b-3d66b95affab@linux.microsoft.com>
Date:   Tue, 23 Feb 2021 21:56:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223081948.GA1836717@jade>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



>>>> -	/*
>>>> -	 * Ask OP-TEE to free all cached shared memory objects to decrease
>>>> -	 * reference counters and also avoid wild pointers in secure world
>>>> -	 * into the old shared memory range.
>>>> -	 */
>>>> -	optee_disable_shm_cache(optee);
>>>> +	if (shutdown) {
>>>> +		optee_disable_shm_cache(optee);
>>>> +	} else {
>>>> +		/*
>>>> +		 * Ask OP-TEE to free all cached shared memory
>>>> +		 * objects to decrease reference counters and
>>>> +		 * also avoid wild pointers in secure world
>>>> +		 * into the old shared memory range.
>>>> +		 */
>>>> +		optee_disable_shm_cache(optee);
>>> Calling optee_disable_shm_cache() in both if and else. It could be
>>> put in front of if().
>>>
>>
>>    Ideally, I could just use optee_remove for shutdown() too.
>> But it would not look good. Hence this approach.
> 
> What is the problem with using optee_remove() for shutdown()?
> 

  There is no problem, I just thought it would be more cleaner/readable
with this approach. If you'd like to keep it simple by just calling
optee_remove() for shutdown() too, I could quickly send out V2.

Thanks for the review.

- Allen
