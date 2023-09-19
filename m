Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F02CD548C
	for <linux-mips@archiver.kernel.org>; Tue, 19 Sep 2023 07:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjISHoF (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 19 Sep 2023 03:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjISHoE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Sep 2023 03:44:04 -0400
X-Greylist: delayed 519 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 00:43:59 PDT
Received: from mail.leeswilly.pl (mail.leeswilly.pl [89.116.26.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E90115
        for <linux-mips@vger.kernel.org>; Tue, 19 Sep 2023 00:43:58 -0700 (PDT)
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
        id 6FF537610B8; Tue, 19 Sep 2023 09:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
        t=1695108918; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
        h=Date:From:To:Subject:From;
        b=OT/IWGhRGAMx/BNgNhBAlq3ghKWbtZr8slRpR31ikYp4DQc6eZofEnqoix7yFWI/Q
         xeC6B9UVxgfBLRV3zilWRdymo69bp8apBfd9RvCHzTvcxMtlHsQZLqAcxpU/wBGvDR
         UGv1z8Caa1AVUpYV8unYrdiEyGHNB5gjo6pt58xJdO5DouP6xKzcmS5b0XkYK7hpX5
         d41Vtpx2DM7dYGrm4pS84o8Ukp2+uK1Zu2LAuLQRKzu96WVIs+I5aRuHlp8g0Nmcak
         zXVt687Lx7qImW4tFlA5MGLeWsxqVvA/YvlGTcWjXYmLkcyF8N4/lTNZM7tUewFfP8
         14HeR10FHwKFQ==
Received: by mail.leeswilly.pl for <linux-mips@vger.kernel.org>; Tue, 19 Sep 2023 07:35:17 GMT
Message-ID: <20230919084500-0.1.3z.bcgk.0.zlbnfqdh8a@leeswilly.pl>
Date:   Tue, 19 Sep 2023 07:35:17 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To:     <linux-mips@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Jakub Lemczak
