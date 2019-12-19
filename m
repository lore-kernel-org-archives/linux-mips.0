Return-Path: <SRS0=XvRh=2K=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_REPLYTO_END_DIGIT,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_NAME_MR_MRS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F5BC43603
	for <linux-mips@archiver.kernel.org>; Fri, 20 Dec 2019 10:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BC602465E
	for <linux-mips@archiver.kernel.org>; Fri, 20 Dec 2019 10:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=joeblasc0.com header.i=@joeblasc0.com header.b="BB4/F1Y0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfLTKED (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 20 Dec 2019 05:04:03 -0500
Received: from standard7.doveserver.com ([67.220.187.210]:49435 "EHLO
        standard7.doveserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfLTKEC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Dec 2019 05:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=joeblasc0.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5nz6drlcwLkkcnrPddyhNVU4n5QUNNiisMSZ45MDcC0=; b=BB4/F1Y0tlXcJSAWvGknZKu9+j
        tK6RYFlvI684e+D2+RyEgDxdc5DB8RJz5wcxepQjwEGfkdUYJlChaurYPZ4XoF5PtbtvTB92AxDVk
        Y2aRGba+k6ABkHd9JDr1G3gSmxONOo4HukDi4zJCbshItpuRI+8kYkvAX2LP7rVMtW4LKtzw/OgVg
        yaHOyE4STuVw5GNsstPw8YVOJA2vZvM6DvpuO0WHPt/WrSLQsgjOSZI7MPORKHEzdHnWDqMQENVb2
        c6Sto9Ztnm7JMUnEAp8LK8ovmGQNyR/d/gTwdGI5rzjObuhHKu7XAtogsjCW20FibS353sL3zKMEo
        yonHCBxw==;
Received: from [172.107.168.105] (port=54420 helo=gmail.com)
        by standard7.doveserver.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <info@gmail.com>)
        id 1ihiIa-00APRa-W7
        for linux-mips@vger.kernel.org; Thu, 19 Dec 2019 00:00:09 +0100
Reply-To: songlile110@gmail.com
From:   Mr Lili <info@gmail.com>
To:     linux-mips@vger.kernel.org
Subject: hello
Date:   18 Dec 2019 17:02:45 -0800
Message-ID: <20191218170244.4B0025DF67CF2149@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - standard7.doveserver.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Get-Message-Sender-Via: standard7.doveserver.com: authenticated_id: 4thuser@joeblasc0.com
X-Authenticated-Sender: standard7.doveserver.com: 4thuser@joeblasc0.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

My name is Mr.Song Lile (I work with a Bank as an account officer=20
in the
Treasury/Credit Control Unit) I want to solicit your attention to=20
receive the money on my behalf.
The purpose of my contacting you is because you live in outside=20
Hong Kong.
When you reply this message, I will send you the full details and=20
more
information about myself and the funds.
Thank you.
Kindest regards,
Mr.Song Lile
songlile110@gmail.com
