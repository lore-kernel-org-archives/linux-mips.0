Reply-To: <a.voropay@vmb-service.ru>
From: "Alexander Voropay" <a.voropay@vmb-service.ru>
Subject: RE: Linux on SNI RM300E ?
Date: Tue, 6 Jul 2004 14:18:01 +0400
Message-ID: <03a001c46342$84ce7210$0200000a@ALEC>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1089105260.40ea6d6cf2f9c@www.x-mail.net>
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Thomas Kunze' <thomas.kunze@xmail.net>
Cc: linux-mips@linux-mips.org
Message-ID: <20040706101801.AJefeGOg2nNy0RJhNrLL-QW6PelA3c6kfbyKLS6hU7c@z>



>i've downloaded the arcdiag-0.2 and served it via tftp. but the RM300E
don't like that file.
>it only says "Bad magic number". what does this mean
(little/bigendian)? 

>the same error-message appears when the to load mipsel boot-images.

 Do you have an originas OS (SINIX ?) supplied with this server ?
Try a `file` GNU utility:
$ file <ANY_BINARIES_FROM_THE_ORIGINAL_OS>
or
$ file <KERNEL_IMAGE_FROM_THE_ORIGINAL_OS>

 Some modern loaders requires ELF binaries (not COFF) so you should
know a full binary file format to load (ELF/COFF/little/bigendian).


--
-=AV=-
