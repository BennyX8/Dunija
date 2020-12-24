import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialog {
  ///Show info, warning or error dialog
  ///notifying the user of any of the afore-listed issues
  static showInfoDialog(
      {@required BuildContext context, @required title, @required msg}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          // Aligns the container to center
          child: Container(
            // A simplified version of dialog.
            width: 150.0,
            // height: 100.0,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    title,
                    style: AppStyles.whiteLabel,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    msg,
                    style: AppStyles.whiteLabel,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  child: Container(
                    width: 100.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0, color: AppColors.accentTrans),
                        borderRadius: BorderRadius.circular(
                          Numbers.largeBoxBorderRadius,
                        ),
                      ),
                      color: AppColors.accentTrans,
                      child: Text(
                        'Verify',
                        style: AppStyles.whiteLabel,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Show Loading Dialog when performing heavy liftings
  static showLoadingDialog(BuildContext context, {msg}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          // Aligns the container to center
          child: Container(
            // A simplified version of dialog.
            width: 150.0,
            height: 200.0,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 1.5,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  msg == null ? 'Loading' : msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Show Dialog when Exit Button Clicked
  static showExitKitchenDialog(
      {@required BuildContext context, @required title, @required msg}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          // Aligns the container to center
          child: Container(
            // A simplified version of dialog.
            width: 300.0,
            // height: 100.0,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    title,
                    style: AppStyles.whiteTitleLabel,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    msg,
                    style: AppStyles.whiteBodyLabel,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),

                ///Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Exit Kitchen Action Button
                    Align(
                      child: Container(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, color: AppColors.accentTrans),
                            borderRadius: BorderRadius.circular(
                              Numbers.largeBoxBorderRadius,
                            ),
                          ),
                          color: AppColors.accent.withOpacity(0.8),
                          child: Text(
                            'Exit Anyway',
                            style: AppStyles.whiteLabel,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 15.0,
                    // ),
                    //Cancel Action Button
                    Align(
                      child: Container(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, color: AppColors.darkAccentTrans),
                            borderRadius: BorderRadius.circular(
                              Numbers.largeBoxBorderRadius,
                            ),
                          ),
                          color: AppColors.darkAccent.withOpacity(0.8),
                          child: Text(
                            'Cancel',
                            style: AppStyles.whiteLabel,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
