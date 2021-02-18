Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1B5C433E0
	for <linux-mips@archiver.kernel.org>; Thu, 18 Feb 2021 20:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8DA664E28
	for <linux-mips@archiver.kernel.org>; Thu, 18 Feb 2021 20:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhBRUGA (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 18 Feb 2021 15:06:00 -0500
Received: from linux.microsoft.com ([13.77.154.182]:53586 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhBRUEA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Feb 2021 15:04:00 -0500
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 6DD6A20B6C40; Thu, 18 Feb 2021 12:03:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6DD6A20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1613678598;
        bh=DZjo1NRFHw7RTdtEBJokhTw9Q/8766pMEGltMN/Ti/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dNcUB+t/DBJc69TqIwLrUU0VVPQNCOwcQ1QKMhTA18HPD6nmdFcX/EyAbMCemTFiA
         THQTnlol+QnJnBJm6VkvsFBdZybpGKmBFe82RkYZnhz//s1p+52uED2iQlFmk0xT6N
         LMq07VwU9LVzisbpd5eJ42PF7BlF9oZ1YR8NM0aY=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     allen.lkml@gmail.com, jens.wiklander@linaro.org, zajec5@gmail.com
Cc:     apais@linux.microsoft.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 1/2] optee: fix tee out of memory failure seen during kexec reboot
Date:   Thu, 18 Feb 2021 12:03:15 -0800
Message-ID: <20210217092714.121297-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20210217092714.121297-2-allen.lkml@gmail.com>
References: <20210217092714.121297-2-allen.lkml@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
Message-ID: <20210218200315.l1hRW9ujVzfHDXIc5_spnAJbiLk2xOvqtsGAusGYOfw@z>

From: Allen Pais <allen.lkml@gmail.com>

On Wed, 17 Feb 2021 14:57:12 +0530, Allen Pais wrote:
> -	/*
> -	 * Ask OP-TEE to free all cached shared memory objects to decrease
> -	 * reference counters and also avoid wild pointers in secure world
> -	 * into the old shared memory range.
> -	 */
> -	optee_disable_shm_cache(optee);
> +	if (shutdown) {
> +		optee_disable_shm_cache(optee);
> +	} else {
> +		/*
> +		 * Ask OP-TEE to free all cached shared memory
> +		 * objects to decrease reference counters and
> +		 * also avoid wild pointers in secure world
> +		 * into the old shared memory range.
> +		 */
> +		optee_disable_shm_cache(optee);
 
Calling optee_disable_shm_cache() in both if and else. It could be
put in front of if().

